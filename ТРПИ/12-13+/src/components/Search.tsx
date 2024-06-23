import { ChangeEvent, useState } from "react";
import './css/Search.css'

interface SearchProps{
    searchMovies: (search: string, type: string | undefined) => void;
}

export function Search(props : SearchProps){
    const searchMovies = props.searchMovies;
    const [search, setSearch] = useState<string>('');
    const [type, setType] = useState<string|undefined>('');

    const handleKey = (event: React.KeyboardEvent) : void =>{
        if (event.key === 'Enter') {
            searchMovies(search, type);
        }
    }

    const handleFilter = (event: ChangeEvent<HTMLInputElement>) : void =>{
        setType(event.target.dataset.type);
        searchMovies(search, event.target.dataset.type);
    }

    return(
        <div className="row">
            <div className="input-field">
                <input
                    placeholder="Search..."
                    className="searchInput"
                    value={search}
                    onChange={(e:ChangeEvent<HTMLInputElement>) : void => setSearch(e.target.value)}
                    onKeyDown={handleKey}
                />
                <button className="btn-search-btn" type="submit"
                    onClick={(): void => {searchMovies(search, type)}}>Search
                </button>

                <div style={{marginTop: 20, fontSize: 16}} className="types"> 
                    <div className="movies-type">
                        <input className="with-gap" name="type" id="type1" type="radio" data-type=''
                        onChange={handleFilter} checked={type===''}/>
                        <label htmlFor="type1">All</label>
                    </div>
                    <div className="movies-type">
                        <input className="with-gap" name="type" id="type2" type="radio" data-type='movie'
                            onChange={handleFilter} checked={type==='movie'}/>
                        <label htmlFor="type2">Movies only</label>
                    </div>
                    <div className="movies-type">
                        <input className="with-gap" name="type" id="type3" type="radio" data-type='series'
                            onChange={handleFilter} checked={type==='series'}/>
                        <label htmlFor="type3" style={{marginRight: 0}}>Series only</label>
                    </div>
                </div>
            </div>
        </div>
    )
}