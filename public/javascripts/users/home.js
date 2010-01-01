/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    enhanceAjaxAddingComment();
    enhanceCommentFormToggable();
    enhanceCommentToggable();
    enhanceAjaxCommentDelete();
})


function enhanceAjaxAddingComment(){
    $("form.ajax").submit(function(){
        var form=$(this);
        $.post(form.attr("action"),form.serialize(),function(latestComments){
            var article_id=form.find("#comment_article_id").val();
            var container=form.parent().find(".comments_list");
            loadLatestComments(article_id, container);
        });
        return false;
    })
}

function enhanceAjaxCommentDelete(){
    $("a.ajaxDelete").click(function(){
        var deleteLink=$(this);
        $.post(deleteLink.attr("href"),null,function(data){
            var article_id=deleteLink.parents(".articleBody").attr("id");
            var container=deleteLink.parents(".articleBody").find(".comments_list");
            loadLatestComments(article_id, container);

        })
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

/*---------util--------*/

function loadLatestComments(article_id,container){
    $.get("/comments/list/"+article_id,null,function(data){
        container.html(data);
        enhanceAjaxCommentDelete();
    })
    
}

