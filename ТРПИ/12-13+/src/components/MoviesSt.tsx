import { MovieTypeSt } from "../state"
import { MovieCard } from "./MovieCard";
import "./css/MovieSt.css";

interface MoviesProps{
    movies: MovieTypeSt[]
}

export function MoviesSt(props: MoviesProps){

    const movies: JSX.Element[] = [];

    props.movies.forEach((movie) => {
        if(movie.type === 'movie'){
            movies.push(<MovieCard movie={movie}/>);
        }
    })

    return(
        <div className="fl">
            {movies}
        </div>
    )
}