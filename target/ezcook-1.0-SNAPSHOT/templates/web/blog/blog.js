// set width height for video player
const setSizeVideo = function () {

    const videos = $$('iframe');

    if (videos) {
        videos.forEach(function (video) {
            const wVideo = parseFloat(video.getAttribute('width'));
            const hVideo = parseFloat(video.getAttribute('height'));
            const heightVideo = (video.clientWidth / wVideo) * hVideo;
            video.setAttribute('height', heightVideo + 'px');
        })
    }
};

// window onresize
window.onresize = function () {
    setSizeVideo();
}

setSizeVideo();