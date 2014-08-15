	$(function(){
      $("#incHeader").load("_header.html");
    });
    
	$(function(){
      $("#incFooter").load("_footer.html"); 
    });
 
     
	$(function(){
      $("#ficConn").load("_fic-conn.html"); 
    });

    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&appId=1410728445875629&version=v2.0";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));