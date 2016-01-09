/**
 * @author: Jun Hu
 * 报表插件
 */

chart=function(option){
 var ops=$.extend({},{
	target:"",
	width:"100%",
	height:"400",
	type:"column2d",
	dataTaye:"xml",
	data:"",
	callback:function(){
	}
 },option); 
 FusionCharts.ready(function(){
	var revenueChart = new FusionCharts({
		"type": ops.type,//报表的形式
		"renderAt": ops.target,//报表统计的目标存放的位置
		"width": ops.width,
		"height": ops.height,
		"dataFormat": ops.datatype,//报表的格式指明:json/xml dataSouce的数据：取决于dataFormat
		"dataSource": ops.data
	  });
		revenueChart.render();
	});
};