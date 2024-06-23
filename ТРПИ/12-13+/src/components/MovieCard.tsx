import { MovieTypeSt } from '../state';
import './css/MovieCard.css';

interface MovesCardProps{
    movie: MovieTypeSt;
}

export function MovieCard(props: MovesCardProps){
    const movie = props.movie;
    return(
        <div className='card'>
            <img src={movie.imagesrc}></img>
            <p className='info'>
                <p id='title'>{movie.title}</p>
                <p className="year">{movie.year}</p>
                <p className="type">{movie.type}</p>
            </p>
        </div>
        
    )
}