function displayLoginWindow() {
    /*悬浮窗口的显示,需要将display变成block*/
    document.getElementById("loginWindow").style.display = "block";
    /*将背景变暗*/
    document.getElementById("shadow").style.display = "block";
}

/*当点击调用此方法,将悬浮窗口和背景全部隐藏*/
function hideLoginWindow() {
    document.getElementById("loginWindow").style.display = "none";
    document.getElementById("shadow").style.display = "none";
}