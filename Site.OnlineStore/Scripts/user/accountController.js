$(document).ready(function () {
    $("#registerLink").click(function () {
        $("#modalLogin").modal("hide");
        $("#modalRegister").modal("show");
    });

    $("#loginLink").click(function () {
        $("#modalLogin").modal("show");
        $("#modalRegister").modal("hide");
    });

    $("#switch-to-signup").click(function () {
        $("#modalLogin").modal("hide");
        $("#modalRegister").modal("show");
    });

    $("#switch-to-login").click(function () {
        $("#modalLogin").modal("show");
        $("#modalRegister").modal("hide");
    });

    $("#form-login").submit(function (event) {
        event.preventDefault();

        $.ajax({
            url: this.action,
            type: this.method,
            data: new FormData(this),
            processData: false,
            contentType: false,
            success: function (result) {
                if (result.success) {
                    location.href = "/";
                } else {
                    $("#form-login #errorMessage").text(result.message);
                }
            }
        });

        return false;
    });

    $("#form-register").submit(function (event) {
        event.preventDefault();

        $.ajax({
            url: this.action,
            type: this.method,
            data: new FormData(this),
            processData: false,
            contentType: false,
            success: function (result) {
                if (result.success) {
                    location.href = "/";
                } else {
                    $("#form-register #errorMessage").text(result.message);
                }
            }
        });

        return false;
    });
});
