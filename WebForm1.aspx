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
        src: '<LINK DO VIDEO>',
        protectionInfo: [
        {
            type: 'Widevine',
            authenticationToken: 'Bearer=<TOKEN>'
        }, {
            type: 'PlayReady',
            authenticationToken: 'Bearer=<TOKEN>'
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
