
var _carbonads={init:function()
{var placement='getbootstrapcom';var serve='C6AILKT';var baseurl='srv.buysellads.com';if(window.location.protocol!='https:')
baseurl='srv.carbonads.net';var pro=document.createElement('script');pro.id='_carbonads_projs';pro.type='text/javascript';pro.src='//'+baseurl+'/ads/'+serve+'.json?segment=placement:'+placement+'&callback=_carbonads_go';var ck=document.cookie,day=ck.indexOf('_bsap_daycap='),life=ck.indexOf('_bsap_lifecap=');day=day>=0?ck.substring(day+12+1).split(';')[0].split(','):[];life=life>=0?ck.substring(life+13+1).split(';')[0].split(','):[];if(day.length||life.length){var freqcap=[];for(var i=0;i<day.length;i++){var adspot=day[i];for(var found=-1,find=0;find<freqcap.length&&found==-1;find++)
if(freqcap[find][0]==adspot)found=find;if(found==-1)freqcap.push([adspot,1,0]);else freqcap[found][1]++;}
for(var i=0;i<life.length;i++){var adspot=day[i];for(var found=-1,find=0;find<freqcap.length&&found==-1;find++)
if(freqcap[find][0]==adspot)found=find;if(found==-1)freqcap.push([adspot,0,1]);else freqcap[found][2]++;}
for(var i=0;i<freqcap.length;i++)
freqcap[i]=freqcap[i].join(',');if(freqcap.length)pro.src+='&freqcap='+freqcap.join(';');}
document.getElementsByTagName('head')[0].appendChild(pro);}};function _carbonads_go(b)
{var ad=b['ads'][0],link,fulllink,image,description;var placement='getbootstrapcom';var serve='C6AILKT';if(ad.html!=null)
ad=JSON.parse(ad.html);if(ad.fetch!=null)
{var fetch=document.createElement('script');fetch.type='text/javascript';fetch.src=ad.fetch+'?'+Math.round(Date.now()/10000);document.getElementsByTagName('head')[0].appendChild(fetch);return;}
image=ad.image;link=ad.statlink.split('?encredirect=');description=ad.description;var style=document.createElement('style');style.innerHTML='.carbonad{display:block;background:#fdfdfd;background-image:-moz-linear-gradient(top,#f8f8f8,#fdfdfd);background-image:-webkit-gradient(linear,left top,left bottom,color-stop(0,#f8f8f8),color-stop(1,#fdfdfd));border:1px solid #d5d5d5;font-family:Lucida Grande,Arial,Helvetica,sans-serif;font-size:11px;height:118px;line-height:15px;overflow:hidden;width:300px}.carbonad-img{border:none;display:inline;float:left;height:100px;margin:9px;width:130px}.carbonad-text{display:inline;float:left;width:142px;padding-top:13px}.carbonad-text a{color:#000;text-decoration:none;text-transform:none;}.carbonad-tag{float:left;margin-top:9px;text-align:center;width:142px;color:#999}.carbonad-tag a{color:#999;text-decoration:none}';if(typeof link[1]!='undefined')
fulllink=link[0]+'?segment=placement:'+placement+';&encredirect='+encodeURIComponent(link[1]);else if(link[0].search('srv.buysellads.com')>0)
fulllink=link[0]+'?segment=placement:'+placement+';';else
fulllink=link[0];if(window.location.protocol!='https:')
fulllink=fulllink.replace('srv.buysellads.com','srv.carbonads.net');var el=document.createElement('span');el.innerHTML='<span class="carbonad-image"><a href="'+fulllink+'" target="_blank"><img width="130" height="100" border="0" src="'+ad.image+'" class="carbonad-image carbonad-img" height="100" width="130" style="max-width:130px;"></a></span><span class="carbonad-text"><a href="'+fulllink+'">'+ad.description+'</a></span><span class="carbonad-tag">ads via <a href="http://carbonads.com"/>Carbon</a></span>';if(typeof ad.pixel!='undefined')
{var pix=document.createElement('img');pix.src=ad.pixel;pix.border='0';pix.height='1';pix.width='1';pix.style.display='none';el.appendChild(pix);}
var legacy=document.getElementById('azcarbon');if(legacy==null)
legacy=document.getElementById('carbon');if(ad!=null)
{try{document.getElementsByTagName('head')[0].appendChild(style);}catch(e){}}
if(legacy!=null)
legacy.appendChild(el);_bsap_serving_callback(ad.bannerid,ad.zonekey,ad.freqcap);}
_carbonads.init();window['_bsap_serving_callback']=function(banner,zone,freqcap){var append=function(w,data,days){var c=document.cookie,i=c.indexOf(w+'='),existing=i>=0?c.substring(i+w.length+1).split(';')[0]+',':'',d=new Date();d.setTime(days*3600000+d);data=existing+data;data=data.substring(0,2048);document.cookie=w+'='+data+'; expires='+d.toGMTString()+'; path=\/';};if(freqcap){append('_bsap_daycap',banner,1);append('_bsap_lifecap',banner,365);}};