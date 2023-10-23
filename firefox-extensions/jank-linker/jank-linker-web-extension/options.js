const KEY_jankHosts = 'jankHosts'
const ID_jankHosts = '#' + KEY_jankHosts
function onError(error) {
    console.log(`Error in Jank Linker Options: ${error}`);
}
function loadOptions() {
    function setCurrentChoice(result) {
        document.querySelector(ID_jankHosts).value = result[KEY_jankHosts] || '';
    }
    let getting = browser.storage.sync.get(KEY_jankHosts);
    getting.then(setCurrentChoice, onError);
}
function storeOptions(e) {
    e.preventDefault();
    let optionsToStore = {}
    optionsToStore[KEY_jankHosts] = document.querySelector(ID_jankHosts).value || ''
    browser.storage.sync.set(optionsToStore);
}

document.addEventListener('DOMContentLoaded', loadOptions);
document.querySelector('form').addEventListener('submit', storeOptions);
