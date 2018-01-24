
define(function(){
 	var addressData = {};
 	
 	city = function cityName(citycode){
 		
 		return addressData[citycode]?addressData[citycode]:"";
 	}
 	
 	 
	return city;
});
