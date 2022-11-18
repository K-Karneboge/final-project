import React from 'react';

export default function FormatCarousel(props) {
  return (

    <div id="carouselFormats" className="carousel slide" data-ride="carousel">
      <ol className="carousel-indicators">
        <li data-target="#carouselFormats" data-slide-to="0" className="active" />
        <li data-target="#carouselFormats" data-slide-to="1" />
        <li data-target="#carouselFormats" data-slide-to="2" />
        <li data-target="#carouselFormats" data-slide-to="3" />
        <li data-target="#carouselFormats" data-slide-to="4" />
        <li data-target="#carouselFormats" data-slide-to="5" />
        <li data-target="#carouselFormats" data-slide-to="6" />
        <li data-target="#carouselFormats" data-slide-to="7" />
        <li data-target="#carouselFormats" data-slide-to="8" />
      </ol>
      <div className="carousel-inner">
        <div className="carousel-item active">
          {/* standard the first item */}
          <img className="d-block w-100" src="https://www.mtgpics.com/pics/art/neo/278.jpg" alt="Standard" />
          <div className="carousel-caption">
            <h5>Standard</h5>
          </div>
        </div>
        <div className="carousel-item">
          {/* pioneer the second item */}
          <img className="d-block w-100" src="https://www.mtgpics.com/pics/art/ths/098.jpg" alt="Pioneer" />
          <div className="carousel-caption">
            <h5>Pioneer</h5>
          </div>
        </div>
        <div className="carousel-item">
          {/* Modern the third item */}
          <img className="d-block w-100" src="https://www.mtgpics.com/pics/art/10m/146.jpg" alt="Modern" />
          <div className="carousel-caption">
            <h5>Modern</h5>
          </div>
        </div>
        <a className="carousel-control-prev" href="#carouselFormats" role="button" data-slide="prev">
          <span className="carousel-control-prev-icon" aria-hidden="true" />
          <span className="sr-only">Previous</span>
        </a>
        <a className="carousel-control-next" href="#carouselFormats" role="button" data-slide="next">
          <span className="carousel-control-next-icon" aria-hidden="true" />
          <span className="sr-only">Next</span>
        </a>
      </div>
    </div>

  );
}
