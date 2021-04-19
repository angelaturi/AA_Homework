document.addEventListener("DOMContentLoaded", function(){
    const canvas = document.getElementById('mycanvas');
    var ctx = canvas.getContext('2d');
    ctx.fillStyle = "red";
    ctx.fillRect(0, 0, 500, 500);

    ctx.beginPath();
    ctx.arc(100, 100, 20, 0, 2 * Math.PI);
    ctx.strokeStyle = 'black';
    ctx.lineWidth =  5;
    ctx.stroke();
    ctx.fillStyle = "blue";
    ctx.fill();
    
});
