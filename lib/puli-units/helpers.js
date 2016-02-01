PULI_HELPERS = {};

PULI_HELPERS.emailConvertToField = function (_emailEle, _field) {
    var _email = _emailEle.value;
    var _user = _email;
    if (_email.indexOf("@") > -1) {
        _user = _email.substr(0, _email.indexOf("@"));
    }
    var _form = _emailEle.form;
    if (typeof(_field) === "string") {
        if (typeof(_form[_field]) === "object") {
            _form[_field].value = _user;
        }
    }
    else {
        for (var _i = 0; _i < _field.length; _i++) {
            var _f = _field[_i];
            if (typeof(_form[_f]) === "object") {
                _form[_f].value = _user;
            }
        }
    }
};

PULI_HELPERS.emailToField = function (_emailEle, _field) {
    var _email = _emailEle.value;
    var _user = _email;
    
    var _form = _emailEle.form;
    if (typeof(_field) === "string") {
        if (typeof(_form[_field]) === "object") {
            _form[_field].value = _user;
        }
    }
    else {
        for (var _i = 0; _i < _field.length; _i++) {
            var _f = _field[_i];
            if (typeof(_form[_f]) === "object") {
                _form[_f].value = _user;
            }
        }
    }
};

$(function () { 
    $("table.listing tr.listing-tr").click(function () {
        location.href = $(this).find("a:last").attr("href");
    });
    
    $("table.listing tr.listing-tr").hover(function () {
        $(this).addClass("hover");
    }, function () {
        $(this).removeClass("hover");
    });
});