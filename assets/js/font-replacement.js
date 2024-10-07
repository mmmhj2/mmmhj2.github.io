
function replace_emstrong() {
    console.log("Replacing chinese fonts")
    const regex_chinese = /\p{Script=Han}+/ug

    const em_list = document.querySelectorAll('em')
    console.log("Found", em_list.length, "<em> tags.")
    for (item of em_list) {
        item.innerHTML = item.innerHTML.replaceAll(regex_chinese, '<cem>$&</cem>')
    }

    const strong_list = document.querySelectorAll('strong')
    console.log("Found", strong_list.length, "<strong> tags.")
    for (item of strong_list) {
        item.innerHTML = item.innerHTML.replaceAll(regex_chinese, '<cstrong>$&</cstrong>')
    }
}

document.addEventListener('DOMContentLoaded', replace_emstrong, false);
