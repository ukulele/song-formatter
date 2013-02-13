// wrap these up in a timer to auto-save them to server
// and return parsed data

$(document).ready(function () {

    var flag = false;

    function repositionSongs() {
        if ($('element').length > 0) {
            var pos = $("#song_body").offset();
            var wid = $("#song_body").outerWidth();
            var new_wid = pos.left + wid + 15;
            $(".scroll_2").css("top", pos.top).css("position", "absolute").css("left", new_wid);

        }
    }

    function update_title() {
        tmp_t = $("#song_title").val().split("/");

        $("#editing_song_title").html(tmp_t[0]).append(" <small>" + tmp_t[1] + "</small>");
    }

    function update_body() {
        if (flag == false) {

            flag = true;
            var valuesToSubmit = $(".simple_form").serialize();

            $.ajax({
                    url: $(".simple_form").attr('action'),
                    data: valuesToSubmit,
                    dataType: "JSON",
                    error: function (obj, status, error) {
                        console.log(error);
                    },
                    success: function (data, status, obj) {
                        var output = JSON.parse(obj.responseText).parsed.join("");
                        $("#song_parse").html(output);
                        flag = false;
                    },
                    statusCode: {
                        404: function () {
                            $("#song_parse").html("404 Not Found Error.");
                        },
                        422: function () {
                            $("#song_parse").html("422 Unprocessable Entity. Is the text editor blank?");
                        },
                        500: function () {
                            $("#song_parse").html("500 Server Error.");
                        }
                    }
                }
            );
        }
    }

    $("#song_body").scroll(function () {
        $(".scroll_2").scrollTop($("#song_body").scrollTop());
    });

    $("#song_title").focusin(function (evt) {

        $(this).keyup(function () {
            update_title();
        });

    });

    $("#song_body").focusin(function (evt) {

        $(this).keyup(function () {
            if ($("#song_body").val()) {
                update_body();
            }
        });

    });

    if ($("#song_title").val()) {
        update_title();
    }

    if ($("#song_body").val()) {
        update_body();
    }

    // ensure song panes are aligned properly all the time
    $(window).resize(function () {
        repositionSongs();
    });

    repositionSongs();
});
