import React from 'react'
import './App.css'
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom'
import PrivateRoute from './containers/PrivateRoute'

function App() {  
  return (
  	<Router>
      <Switch>
    		<Route exact path='/'>
    			index
    		</Route>
        <Route path='/login'>
        login
        </Route>
  	  	<PrivateRoute path='/home'>
  	  		private
  	  	</PrivateRoute>
      </Switch>
  	</Router>
  )
}

export default App