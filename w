const loadingCircle = document.getElementById('loadingCircle');
const gifPopup = document.getElementById('gifPopup');
const popupGif = document.getElementById('popupGif');
const closeButton = document.getElementById('popupCloseButton');
const markerStatus = document.getElementById('markerStatus');
const markerBoundary = document.getElementById('markerBoundary');

// ボタン1とボタン2
const button1 = document.getElementById('button1');
const button2 = document.getElementById('button2');

// GIFのパス
const gifPaths = {
    city1: ['human_tb.gif', 'human_t.gif'],
    city2: ['dog_tb.gif', 'dog_t.gif'],
    city3: ['cat_tb.gif', 'cat_t.gif'],
    city4: ['crow_tb.gif', 'crow_t.gif'],
    grass1: ['giraffe_tb.gif', 'giraffe_t.gif'],
    grass2: ['meerkat_tb.gif', 'meerkat_t.gif'],
    grass3: ['horse_tb.gif', 'horse_t.gif'],
    grass4: ['kangaroo_tb.gif', 'kangaroo_t.gif']
};

let isPlaying = false;
let currentGifIndex = 0;

function updateMarkerStatus(show, isMarkerFound = false) {
    if (isPlaying) return;

    if (show) {
        if (isMarkerFound) {
            markerStatus.innerText = "マーカーを検出中...";
            markerStatus.style.color = "green";
        } else {
            markerStatus.innerText = "マーカーが見つかりません";
            markerStatus.style.color = "red";
        }
        markerStatus.style.display = "block";
    } else {
        markerStatus.style.display = "none";
    }
}

// マーカーが検出されたかどうか
const scene = document.querySelector('a-scene');
scene.addEventListener('markerFound', (e) => {
    const markerId = e.target.id;
    updateMarkerStatus(true, true);
    showPopupGif(gifPaths[markerId]);
});

scene.addEventListener('markerLost', () => {
    updateMarkerStatus(true, false);
});

// GIFの表示
function showPopupGif(gifPathsArray) {
    if (isPlaying) return;

    isPlaying = true;
    currentGifIndex = 0;
    const gif = popupGif;

    function playGif(index) {
        gif.src = gifPathsArray[index];
        markerBoundary.style.display = 'none';  // ポップアップ中にマーカー枠を隠す
    }

    loadingCircle.style.display = 'block';
    gifPopup.style.display = 'none';

    gif.onload = () => {
        loadingCircle.style.display = 'none';
        gifPopup.style.display = 'block';
    };

    gif.onerror = () => {
        setTimeout(() => {
            playGif(currentGifIndex);
        }, 500);
    };

    playGif(currentGifIndex);
}

// ポップアップ閉じる
closeButton.addEventListener('click', () => {
    gifPopup.style.display = 'none';
    isPlaying = false;
    currentGifIndex = 0;
    markerBoundary.style.display = 'block'; // ポップアップが閉じられたら枠を再表示
});

// ボタン1の動作
button1.addEventListener('click', () => {
    const markerId = "city1"; // ここで対象マーカーIDを指定
    showPopupGif(gifPaths[markerId]);
});

// ボタン2の動作
button2.addEventListener('click', () => {
    const markerId = "city2"; // ここで対象マーカーIDを指定
    showPopupGif(gifPaths[markerId]);
});
