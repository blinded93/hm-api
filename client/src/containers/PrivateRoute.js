import React, { Fragment } from 'react'
import { Route, Switch, Redirect } from 'react-router-dom'
import Nav from './Nav'

function PrivateRoute({ children, ...rest }) {
  const isAuthed = () => false

	return (
		<Route
			render={({ location }) =>
				isAuthed() ? (
					children
				) : (
					<Redirect
						to={{
							pathname: '/login',
							state: { from: location }
						}}
					/>	
				)
			}
		/>
	)
}

export default PrivateRoute