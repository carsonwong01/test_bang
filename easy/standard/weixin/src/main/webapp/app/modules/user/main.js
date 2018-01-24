require.config({
    paths: {
        userController : 'app/modules/user/controller',
        userModel : 'app/modules/user/model',
        indexModel : 'app/modules/index/model',
        userView : 'app/modules/user/view',
        userTemplate : 'app/modules/user/template'
    }
});
//拉起对应controller单例
define(['userController/PasswordController','userController/PersonalController','userController/PaymentController',
        'userController/MyBusinessController'], 
        function(PasswordController,UserInfoController,PaymentController,MyBusinessController){
    return function(){ 
    	PasswordController.getInstance();
    	UserInfoController.getInstance();
    	PaymentController.getInstance();
    	//MyBusinessController.getInstance();
    }
});