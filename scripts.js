const loadingCircle = document.getElementById('loadingCircle');
const gifPopup = document.getElementById('gifPopup');
const popupGif = document.getElementById('popupGif');
const closeButton = document.getElementById('closeButton'); 
const markerStatus = document.getElementById('markerStatus');
const markerBoundary = document.getElementById('markerBoundary');

const button1 = document.getElementById('button1');
const button2 = document.getElementById('button2');

const gifPaths = {
    city1: ['human_tb.gif', 'human_t.gif'],
    city2: ['dog_tb.gif', 'dog_t.gif'],
    city3: ['cat_tb.gif', 'cat_t.gif'],
    city4: ['crow_tb.gif', 'crow_t.gif'],
    grass1: ['giraffe_tb.gif', 'giraffe_t.gif'],
    grass2: ['meerkat_tb.gif', 'meerkat_t.gif'],
    grass3: ['horse_tb.gif', 'horse_t.gif'],
    grass4: ['kangaroo_tb.gif', 'kangaroo_t.gif'],
    jungle1: ['gibbon_tb.gif', 'gibbon_t.gif'],
    jungle2: ['bear_tb.gif', 'bear_t.gif'],
    jungle3: ['ezorisu_tb.gif', 'ezorisu_t.gif'],
    jungle4: ['deer_tb.gif', 'deer_t.gif'],
    ocean1: ['penguin_tb.gif', 'penguin_t.gif'],
    ocean2: ['seal_tb.gif', 'seal_t.gif'],
    ocean3: ['seaotter_tb.gif', 'seaotter_t.gif'],
    ocean4: ['seaturtle_tb.gif', 'seaturtle_t.gif']
};

let currentGifIndex = 0;

function showPopupGif(gifPathsArray) {
    loadingCircle.style.display = 'block';
    gifPopup.style.display = 'none';

    popupGif.onload = () => {
        loadingCircle.style.display = 'none';
        gifPopup.style.display = 'block';
    };

    popupGif.src = gifPathsArray[currentGifIndex];
}

closeButton.addEventListener('click', () => {
    gifPopup.style.display = 'none';
    markerBoundary.style.display = 'block';
});

button1.addEventListener('click', () => {
    currentGifIndex = 0;
    popupGif.src = gifPathsArray[currentGifIndex];
});

button2.addEventListener('click', () => {
    currentGifIndex = 1;
    popupGif.src = gifPathsArray[currentGifIndex];
});
