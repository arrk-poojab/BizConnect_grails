import com.bizconnect.*;
class BootStrap {

    def init = { servletContext ->

        def Role1 = new Roles(authority: "ROLE_ADMIN").save()
        def Role2 = new Roles(authority: "ROLE_USER").save()

        def user1 = new User(
                    username: "admin",
                    password: "admin",
                    enabled: true).save()
        def user2 = new User(
                username: "Rob",
                password: "Password",
                enabled: true).save()

      def UserRoles1
        UserRoles1 = new UserRoles(user: user1,
                roles: Role1
        ).save()
        def UserRoles2 = new UserRoles(user:user2,
                roles: Role2
        ).save()

        }


}
