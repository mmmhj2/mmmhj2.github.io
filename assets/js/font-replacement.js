
function replace_italics() {
    console.log("Replacing chinese fonts")
    const regex_chinese = /\p{Script=Han}+/u

    const em_list = document.querySelectorAll('em')
    console.log("Found", em_list.length, "<em> tags")
    for (item of em_list) {
        item.innerHTML = item.innerHTML.replace(regex_chinese, '<citalics>$&</citalics>')
    }
}

document.addEventListener('DOMContentLoaded', replace_italics, false);
