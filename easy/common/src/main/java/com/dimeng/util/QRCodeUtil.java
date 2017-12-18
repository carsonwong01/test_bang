/*
 * 文 件 名:  QRCodeUtil.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月8日
 */
package com.dimeng.util;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.geom.RoundRectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Hashtable;

/**
 * 二维码工具类
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月8日]
 */
public class QRCodeUtil
{
    
    /**
     * 编码
     */
    private static final String CHARSET = "UTF-8";
    
    /**
     * 图片格式
     */
    private static final String FORMAT_NAME = "JPG";
    
    /**
     * 二维码尺寸
     */
    private static final int QRCODE_SIZE = 118;
    
    /**
     * LOGO宽度
     */
    private static final int WIDTH = 18;
    
    /**
     * LOGO高度
     */
    private static final int HEIGHT = 18;
    
    /**
     * 创建二维码
     * <功能详细描述>
     * @param content
     * @param fileName
     * @param imgPath
     * @return
     * @throws WriterException 
     * @throws IOException 
     */
    private static BufferedImage createImage(String content, String fileName, String imgPath)
        throws WriterException, IOException
    {
        Hashtable<EncodeHintType, Object> hints = new Hashtable<EncodeHintType, Object>();
        hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
        hints.put(EncodeHintType.CHARACTER_SET, CHARSET);
        hints.put(EncodeHintType.MARGIN, 1);
        BitMatrix bitMatrix =
            new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE, QRCODE_SIZE, QRCODE_SIZE, hints);
        int width = bitMatrix.getWidth();
        int height = bitMatrix.getHeight();
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        for (int x = 0; x < width; x++)
        {
            for (int y = 0; y < height; y++)
            {
                image.setRGB(x, y, bitMatrix.get(x, y) ? 0xFF000000 : 0xFFFFFFFF);
            }
        }
        if (imgPath == null || "".equals(imgPath))
        {
            return image;
        }
        //插入LOGO
        QRCodeUtil.insertImage(image, imgPath, fileName);
        return image;
    }
    
    /**
     * 插入LOGO
     * <功能详细描述>
     * @param source  二维码图片
     * @param imgPath LOGO图片地址
     * @param fileName 文件名
     * @throws IOException 
     */
    private static void insertImage(BufferedImage source, String imgPath, String fileName)
        throws IOException
    {
        File file = new File(imgPath);
        if (!file.exists())
        {
            System.err.println("" + imgPath + "   该文件不存在！");
            return;
        }
        
        Image src = ImageIO.read(new File(imgPath));
        int width = src.getWidth(null);
        int height = src.getHeight(null);
        if (width > WIDTH)
        {
            width = WIDTH;
        }
        if (height > HEIGHT)
        {
            height = HEIGHT;
        }
        Image image = src.getScaledInstance(width, height, Image.SCALE_SMOOTH);
        BufferedImage tag = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics g = tag.getGraphics();
        //绘制缩小后的图
        g.drawImage(image, 0, 0, null);
        g.dispose();
        src = image;
        
        //插入LOGO
        Graphics2D graph = source.createGraphics();
        int x = (QRCODE_SIZE - width) / 2;
        int y = (QRCODE_SIZE - height) / 2;
        graph.drawImage(src, x, y, width, height, null);
        Shape shape = new RoundRectangle2D.Float(x, y, width, width, 6, 6);
        graph.setStroke(new BasicStroke(3f));
        graph.draw(shape);
        graph.dispose();
    }
    
    /**
     * 生成二维码(内嵌LOGO)
     * <功能详细描述>
     * @param content  内容
     * @param destPath 存储地址
     * @param fileName 文件名
     * @param imgPath  LOGO地址
     * @throws IOException 
     * @throws WriterException 
     */
    public static void encode(String content, String destPath, String fileName, String imgPath)
        throws WriterException, IOException
    {
        BufferedImage image = QRCodeUtil.createImage(content, fileName, imgPath);
        File file = new File(destPath);
        //当路径不存在时会自动创建
        if (!file.exists() && !file.isDirectory())
        {
            file.mkdirs();
        }
        ImageIO.write(image, FORMAT_NAME, new File(destPath + File.separator + fileName));
    }
    
    /**
     * 生成二维码(不内嵌LOGO)
     * <功能详细描述>
     * @param content  内容
     * @param destPath 存储地址
     * @param fileName 文件名
     * @throws IOException 
     * @throws WriterException 
     */
    public static void encode(String content, String destPath, String fileName)
        throws WriterException, IOException
    {
        encode(content, destPath, fileName, null);
    }
    
}
