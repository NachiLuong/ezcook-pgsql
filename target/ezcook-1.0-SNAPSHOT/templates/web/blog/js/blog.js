const video = $('iframe');
const wVideo = parseFloat(video.getAttribute('width'));
const hVideo = parseFloat(video.getAttribute('height'));

// set width height for video player
const setSizeVideo = function () {
    const heightVideo = (video.clientWidth / wVideo) * hVideo;
    video.setAttribute('height', heightVideo + 'px');
};

// window onresize
window.onresize = function () {
    setSizeVideo();
}

setSizeVideo();