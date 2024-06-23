import { Movie } from "./Movie";
import { MovieType } from '../api/api';
import { MovieCard } from "./MovieCard";
import { MovieTypeSt } from '../state';

type MoviesType = {
    films : MovieType[],
}

function Movies(props: MoviesType){
    const {films = []} = props;
    return <div className="fl">
        {films.length ? (films.map(film => (<MovieCard movie={{imagesrc: film.Poster, title: film.Title, year: film.Year, type: film.Type}}/>))) :
        (<h4 style={{fontSize: 20, marginBottom: 286, fontFamily: 'Montserrat', color: "black"}}>Nothing Found</h4>)}
    </div>
}

export {Movies}