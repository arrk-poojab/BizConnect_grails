package com.bizconnect

import org.apache.commons.lang.builder.HashCodeBuilder

class UserRoles implements Serializable {

	User user
	Roles roles

	boolean equals(other) {
		if (!(other instanceof UserRoles)) {
			return false
		}

		other.user?.id == user?.id &&
			other.roles?.id == roles?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (user) builder.append(user.id)
		if (roles) builder.append(roles.id)
		builder.toHashCode()
	}

	static UserRoles get(long userId, long rolesId) {
		find 'from UserRoles where user.id=:userId and roles.id=:rolesId',
			[userId: userId, rolesId: rolesId]
	}

	static UserRoles create(User user, Roles roles, boolean flush = false) {
		new UserRoles(user: user, roles: roles).save(flush: flush, insert: true)
	}

	static boolean remove(User user, Roles roles, boolean flush = false) {
		UserRoles instance = UserRoles.findByUserAndRoles(user, roles)
		if (!instance) {
			return false
		}

		instance.delete(flush: flush)
		true
	}

	static void removeAll(User user) {
		executeUpdate 'DELETE FROM UserRoles WHERE user=:user', [user: user]
	}

	static void removeAll(Roles roles) {
		executeUpdate 'DELETE FROM UserRoles WHERE roles=:roles', [roles: roles]
	}

	static mapping = {
		id composite: ['roles', 'user']
		version false
	}
}
