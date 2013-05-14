Ext.apply(Ext.form.field.VTypes, {
    passwd: function (val, field) {
        if (field.initialPassField) {
            var pwd = Ext.getCmp(field.initialPassField);
            return (val == pwd.getValue());
        }
        return true;
    },
    passwdText: '两次输入的密码不一致！',

    chinese: function (val, field) {
        return (/^[\u4e00-\u9fa5]+$/i).test(val);
    },
    chineseText: '请输入中文',

    age: function (val, field) {
        return parseInt(val) >= 0 && parseInt(val) <= 150;
    },
    ageText: '年龄输入有误',

    alphanum: function (val, field) {
        return !(/\W/.test(val));
    },
    alphanumText: '请输入英文字母或是数字,其它字符是不允许的.',

    url: function (val, field) {
        return /^(http|https|ftp):\/\/(([A-Z0-9][A-Z0-9_-]*)(\.[A-Z0-9][A-Z0-9_-]*)+)(:(\d+))?\/?/i.test(val);
    },
    urlText: '请输入有效的URL地址.',

    max: function (val, field) {
        return parseFloat(val) <= parseFloat(field.max);
    },
    maxText: '超过最大值',

    min: function (val, field) {
        return parseFloat(val) >= parseFloat(field.min);
    },
    minText: '小于最小值',

    datecn: function (val, field) {
        return (/^(\d{4})-(\d{2})-(\d{2})$/.test(val));
    },
    datecnText: '请使用这样的日期格式: yyyy-mm-dd. 例如:2008-06-20.',

    integer: function (val, field) {
        return /^[-+]?[\d]+$/.test(val);
    },
    integerText: '请输入正确的整数',

    minlength: function (val, field) {
        return val.length >= parseInt(field.minlen);
    },
    minlengthText: '长度过小',

    maxlength: function (val, field) {
        return val.length <= parseInt(field.maxlen);
    },
    maxlengthText: '长度过大',

    ip: function (val, field) {
        return /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/.test(val);
    },
    ipText: '请输入正确的IP地址',

    phone: function (val, field) {
        return /^((0[1-9]{3})?(0[12][0-9])?[-])?\d{6,8}$/.test(val);
    },
    phoneText: '请输入正确的电话号码,如:0920-29392929',

    mobilephone: function (val, field) {
        return /(^0?[1][35][0-9]{9}$)/.test(val);
    },
    mobilephoneText: '请输入正确的手机号码',

    alpha: function (val, field) {
        return /^[a-zA-Z]+$/.test(val);
    },
    alphaText: '请输入英文字母',

    money: function (val, field) {
        return /^\d+\.\d{2}$/.test(val);
    },
    moneyText: '请输入正确的金额'
});