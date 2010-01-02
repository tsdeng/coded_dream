/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    enahanceAjaxActiveArticle();
})


function enahanceAjaxActiveArticle(){
    $(".ajaxActiveOrDeactive").click(function(){
        var link=$(this);
        $.post($(this).attr("href")+".ajax",null,function(newState){
            link.parent().find("span.state").html(newState);
        })
        return false;
    })
}