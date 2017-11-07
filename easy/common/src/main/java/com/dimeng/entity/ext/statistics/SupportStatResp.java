package com.dimeng.entity.ext.statistics;

import java.io.Serializable;
import java.util.List;

/**
 * 封装分页和数据集
 * @author God
 *
 */
public class SupportStatResp  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String userId;
	
	/**
	 * 统计数据集合
	 */
	private List<UserSupportStatResp> dataList;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public List<UserSupportStatResp> getDataList() {
		return dataList;
	}

	public void setDataList(List<UserSupportStatResp> dataList) {
		this.dataList = dataList;
	}
	
	
}
