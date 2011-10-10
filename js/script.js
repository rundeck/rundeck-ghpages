/* Author: 

*/
(function(){
    //modify links/text for current rundeck version
    var rdvalue=function(name){
        if(typeof(RDVERS)=="object" && typeof(RDVERS[name]) == 'string' && RDVERS[name] ){
            return RDVERS[name];
        }else{
            return null;
        }
    };
    //text
    $(['version','jar_name','jar_sha']).each(function(x,prop){
        if(rdvalue(prop)){
            $('.rd_'+prop).each(function(){
                $(this).text(RDVERS[prop]);   
            });
        }
    });
    //links
    $(['jar_url','tarball','zipball','releasenotes']).each(function(x,prop){
        if(rdvalue(prop)){
            $('a.rd_'+prop).each(function(){
                $(this).attr('href',RDVERS[prop]);
            });
        }
    });
}
)();
