const btnUpHeader = $('#header-up');

window.onscroll = () => {
    if (window.scrollY > 100) {
        btnUpHeader.style.display = 'block';
    } else {
        btnUpHeader.style.display = 'none';
    }
}