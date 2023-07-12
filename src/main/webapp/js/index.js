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

layui.use(function(){
    var layer = layui.layer;
    var util = layui.util;
    var $ = layui.$;
    // 事件
    util.on('lay-on', {
        'test-offset-r': function(){
            layer.open({
                type: 1,
                offset: 'r',
                anim: 'slideLeft', // 从右往左
                area: ['320px', '100%'],
                shade: 0.1,
                shadeClose: true,
                id: 'ID-demo-layer-direction-r',
                content: '<div style="padding: 16px;">任意 HTML 内容</div>'
            });
        }
    });
});

$(function () {
    $('#search-text').click(function() {
            var inputText = $("#search-box").val(); // 获取输入框的值

            window.location.href = 'search.jsp?keyWord='+inputText;

            $("#search-box").val(''); // 清空输入框的值
    });
});