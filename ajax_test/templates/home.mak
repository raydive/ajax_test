<!doctype html>
<html lang="jp">
<head>
	<title>ajaxテスト</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="${request.static_url('ajax_test:static/css/kube.min.css')}" />
    <link rel="stylesheet" type="text/css" href="${request.static_url('ajax_test:static/css/master.css')}" />
    <link rel="stylesheet" type="text/css" href="${request.static_url('ajax_test:static/css/colorbox.css')}" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script>
        $(document).ready(function()
        {
            $("#hidden").hide();

            $("#send").click(
                function(){
                    var data = { send_data : $("#search").val() };
                    $.getJSON('/ajax', data, success);
                }
            );

            function success(data, status)
            {
                $("#hidden").show();
                $("#testArea").append(data.send_data);
            }
        })
    </script>
</head>
<body>
    <header>
        <section id="title">AJAX のテスト</section>
    </header>
    <section class="container row">
        <section class="third">
            <label class="bold">Search</label>
            <br>
            <span class="btn-group">
                <input type="text" name="foo" class="input-search" id="search">
                <button class="btn btn-round" id="send">検索</button>
            </span>
        </section>
        <section id="testArea" class="twothird">
            <p id="hello">Hello,<span id="hidden"> world</span></p>
        </section>
    </section>
</body>
</html>