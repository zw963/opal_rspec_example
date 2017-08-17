// 下面这个 class, 作为被测试的内容在这里定义.

// 下面这个 class 初始化了一个 class 定义, 使用这个类创建一个对象时,
// 需要传入 first, last 名称.
// 这个对象有一个 fullName 属性, 还有一个 yearBornIfThisOld 方法.

function JsClassToBeTested(first, last){
    this.fullName = first + " " + last;
    this.yearBornIfThisOld = function(ageInYears) {
        var yearsAgo = new Date();
        yearsAgo.setTime(yearsAgo.valueOf() - ageInYears * 365 * 24 * 60 * 60 * 1000);
        return yearsAgo.getFullYear();
    };
}
