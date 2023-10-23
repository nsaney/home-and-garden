const KEY_jankHosts = 'jankHosts'
function onError(error) {
    console.log(`Error in Jank Linker: ${error}`);
}
function onLoadOptions(result) {
    let jankHostsText = result[KEY_jankHosts] || ''
    let jankHosts = jankHostsText.split(',')
    window.addEventListener('click', function (event) {
        let link = event.target;
        while (link && link.localName != 'a') {
            link = link.parentNode
        }
        if (!link) {
            return;
        }
        let href = link.href
        if (href.startsWith('jank:')) {
            return
        }
        let url = new URL(href)
        console.log('Checking for jank link based on URL hostname: ' + url.hostname)
        if (jankHosts.includes(url.hostname)) {
            jankref = 'jank:' + href
            jankhor = document.createElement('a')
            jankhor.href = jankref
            jankhor.click()
            event.preventDefault()
        }
    }, false);
    console.log('Jank Linker active!')
}
const getting = browser.storage.sync.get(KEY_jankHosts)
getting.then(onLoadOptions, onError)