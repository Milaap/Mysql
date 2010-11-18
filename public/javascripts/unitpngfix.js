var clear="http://www.golfingtimes.in/site/images/clear.gif" //path to clear.gif
var classname = new Array(
'amount-blurb',
'accordion',
'shadow0',
'shadow1',
'ie-png'


);
//
//'cc_panel_top_fix');//name of the class where to apply png fix.

function getVars(){
	var mainarr = new Array();
	var total = document.getElementsByTagName("*");
    for(var i=0;i<total.length;i++){	
	if(total[i].className !=''){
		for(var j=0;j<classname.length;j++){
			if(total[i].className == classname[j]){
				mainarr.push(total[i]);
				break;
			}
		}
	}
}

return mainarr;
}//function ends.	
pngfix=function(){var els = getVars();var ip=/\.png/i;var i=els.length;while(i-- >0){var el=els[i];var es=el.style;if(el.src&&el.src.match(ip)&&!es.filter){es.height=el.height;es.width=el.width;es.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+el.src+"',sizingMethod='crop')";el.src=clear;}else{var elb=el.currentStyle.backgroundImage;if(elb.match(ip)){var path=elb.split('"');var rep=(el.currentStyle.backgroundRepeat=='no-repeat')?'crop':'scale';es.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+path[1]+"',sizingMethod='"+rep+"')";es.height=el.clientHeight+'px';es.backgroundImage='none';var elkids=el.getElementsByTagName('*');if (elkids){var j=elkids.length;if(el.currentStyle.position!="absolute")es.position='static';while (j-- >0)if(!elkids[j].style.position)elkids[j].style.position="relative";}}}}}
window.attachEvent('onload',pngfix);