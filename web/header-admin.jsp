<script src="/mobileshop/js/jquery.3.6.0.min.js"></script>
<style>
    #pop-menu{
        position: absolute !important;
        width: 120px;
        padding: 5px;
        z-index: 99;
        display: none;
        top: 80px;
        background: white;
        border: solid 1px white;
        border-radius: 5px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    }
    
    .pop-menu-item{
        cursor: pointer;
        padding: 5px;
        margin-top: 5px;
    }
    
    .pop-menu-item:hover{
        background: #c2b4e3;
    }
    
    #header-title{
        margin-left: 10px;
    }
</style>
<div id="header">
    <div id="header-image">
        <img id="logo" src="/mobileshop/images/admin-logo.png">       
    </div>
    <div  id="header-title">
         Administration Page
    </div>
    <div id="header-right">      
        <% 
        if (session.getAttribute("username")!=null && session.getAttribute("userrole").toString().equals("1")) 
        { 
        %>
        <div id="header-login" class="active-menu">
            <div>
                ${username}
            </div>            
        </div>
        <div id="pop-menu">
            <div class="pop-menu-item" onclick="window.document.location='/mobileshop/admin'">Home</div>
            <div class="pop-menu-item" onclick="window.document.location='/mobileshop/logout'">Log out</div>
        </div>         
        <%  }else{ %>
         <div id="header-login" onclick="window.document.location='login'">
            Login
        </div>
        <%  } %>        
    </div>       
</div>
<script>
$("#search-box").on("keyup",function(e){    
    if(e.keyCode == 13)
    {        
        window.document.location="search?term="+$("#search-box").val().toLowerCase();
    }
});

$(".active-menu").on("click",function(e){  
    if($("#pop-menu").css("display")==="block"){
        $("#pop-menu").css("display", "none");
    }else{
        $("#pop-menu").css("display", "block");
    }
   
});
</script>
