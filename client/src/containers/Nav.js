import React, { Componenet, Fragment } from 'react'
import { Button } from 'semantic-ui-react'

const Nav = props => {
	const handleClick = e => {
		alert('This click has been handled...!')
	}

	return (
		<Fragment>
			<Button onClick={handleClick}>Click Here!</Button>
		</Fragment>
	)
}

export default Nav