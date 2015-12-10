<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Azure Media Player</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="jQuery-2.1.4.min.js"></script>
    <link href="//amp.azure.net/libs/amp/latest/skins/amp-default/azuremediaplayer.min.css" rel="stylesheet">
    <script src="//amp.azure.net/libs/amp/1.5.0/azuremediaplayer.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <canvas runat="server" id="canvas1"></canvas>
            <video 
                id="video1" 
                runat="server" 
                class="azuremediaplayer amp-default-skin amp-big-play-centered" 
                controls 
                poster="">
            </video>
        </div>
    </form>
</body>
<script>
    var videoElement = document.getElementById('<%=video1.ClientID%>');
    videoElement.setAttribute('webkit-playsinline', 'true');
    videoElement.width = '1280';
    videoElement.height = '720';
    var x, y, min, tempo = 0;
    var nroRender = 201;
    var myPlayer = amp(videoElement);
    myPlayer.src([{
        src: 'http://safecopymediaservices.streaming.mediaservices.windows.net/5470b10c-7617-4803-b8dd-41b60488372a/doga10.ism/manifest',
        protectionInfo: [
        {
            type: 'Widevine',
            authenticationToken: 'Bearer=urn%3amicrosoft%3aazure%3amediaservices%3acontentkeyidentifier=c6af3760-6b3c-4fa0-97b1-425f0bfa1fdf&Audience=urn%3atest&ExpiresOn=1480166583&Issuer=https%3a%2f%2fdevsolteste.accesscontrol.windows.net%2f&HMACSHA256=E0unXCdQA7sclk5%2fpKQWEBQaS2QmXjkXIlfkzEc2Tko%3d'
        }, {
            type: 'PlayReady',
            authenticationToken: 'Bearer=urn%3amicrosoft%3aazure%3amediaservices%3acontentkeyidentifier=c6af3760-6b3c-4fa0-97b1-425f0bfa1fdf&Audience=urn%3atest&ExpiresOn=1480166583&Issuer=https%3a%2f%2fdevsolteste.accesscontrol.windows.net%2f&HMACSHA256=E0unXCdQA7sclk5%2fpKQWEBQaS2QmXjkXIlfkzEc2Tko%3d'
        }]
    }]);

    var canvasElement = document.getElementById('<%=canvas1.ClientID%>');
    canvasElement.width = '1280';
    canvasElement.height = '720';
    var ctx = canvasElement.getContext('2d');

    function desenha() {
        ctx.clearRect(0, 0, canvasElement.width, canvasElement.height);
        ctx.drawImage($('#video1 video')[0], 0, 0, canvasElement.width, canvasElement.height);
    }

    function loop() {
        desenha();
        setTimeout(loop, 1000 / 60);
    }

    loop();
</script>
</html>
