package com.bizconnect



import org.junit.*
import grails.test.mixin.*

@TestFor(UserRolesController)
@Mock(UserRoles)
class UserRolesControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/userRoles/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.userRolesInstanceList.size() == 0
        assert model.userRolesInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.userRolesInstance != null
    }

    void testSave() {
        controller.save()

        assert model.userRolesInstance != null
        assert view == '/userRoles/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/userRoles/show/1'
        assert controller.flash.message != null
        assert UserRoles.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/userRoles/list'

        populateValidParams(params)
        def userRoles = new UserRoles(params)

        assert userRoles.save() != null

        params.id = userRoles.id

        def model = controller.show()

        assert model.userRolesInstance == userRoles
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/userRoles/list'

        populateValidParams(params)
        def userRoles = new UserRoles(params)

        assert userRoles.save() != null

        params.id = userRoles.id

        def model = controller.edit()

        assert model.userRolesInstance == userRoles
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/userRoles/list'

        response.reset()

        populateValidParams(params)
        def userRoles = new UserRoles(params)

        assert userRoles.save() != null

        // test invalid parameters in update
        params.id = userRoles.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/userRoles/edit"
        assert model.userRolesInstance != null

        userRoles.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/userRoles/show/$userRoles.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        userRoles.clearErrors()

        populateValidParams(params)
        params.id = userRoles.id
        params.version = -1
        controller.update()

        assert view == "/userRoles/edit"
        assert model.userRolesInstance != null
        assert model.userRolesInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/userRoles/list'

        response.reset()

        populateValidParams(params)
        def userRoles = new UserRoles(params)

        assert userRoles.save() != null
        assert UserRoles.count() == 1

        params.id = userRoles.id

        controller.delete()

        assert UserRoles.count() == 0
        assert UserRoles.get(userRoles.id) == null
        assert response.redirectedUrl == '/userRoles/list'
    }
}
