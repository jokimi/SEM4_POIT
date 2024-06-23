import { Link } from 'react-router-dom'
import './css/Footer.css'

export function Footer(){
    return(
        <footer className="footer">
            <div className="symbols">
                <a href='https://github.com/jokimi'><img src="/images/github.png" className='symbol'></img></a>
            </div>
        </footer>
    )
}