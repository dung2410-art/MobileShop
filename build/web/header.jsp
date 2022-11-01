<script src="js/jquery.3.6.0.min.js"></script>
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
</style>
<div id="header">
    <div id="header-image">
        <img id="logo" src="images/dung_mobile.png">       
    </div>
    <div  id="header-title">
         Dung's Mobile Shop
    </div>
    <div id="header-right">      
        <% 
        if (session.getAttribute("username")!=null) 
        { 
        %>
        <div id="header-login" class="active-menu">
            <div>
                ${username}
            </div>            
        </div>
        <div id="pop-menu">
            <div class="pop-menu-item" onclick="window.document.location=''">Home</div>
            <div class="pop-menu-item" onclick="window.document.location='logout'">Log out</div>
        </div>         
        <%  }else{ %>
         <div id="header-login" onclick="window.document.location='login'">
            Login
        </div>
        <%  } %>
        <div id="cart">            
            <i class="fa fa-cart-plus"></i>
        </div>
        <div id="header-search">
            <input id="search-box" type="text">
            <i class="fa fa-search"></i> 
        </div>
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
