/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    enhanceAjaxAddingComment();
    enhanceCommentFormToggable();
    enhanceCommentToggable();
})


function enhanceAjaxAddingComment(){
    $("form.ajax").submit(function(){
        var form=$(this);
        $.post(form.attr("action"),form.serialize(),function(latestComments){
            form.parent().find(".comments_list").html(latestComments);
        });
        return false;
    })
}

function enhanceCommentFormToggable(){
    $("form.comment_form").hide();
    $(".toggleCommentForm").click(function(){
            $(this).siblings("form.comment_form").toggle();
            return false;
        }
        )
       
   
}

function enhanceCommentToggable(){
   $(".comments_list").hide();
    $(".toggleComments").click(function(){
       $(this).siblings(".comments_list").toggle();
        return false;
    })
    
}

