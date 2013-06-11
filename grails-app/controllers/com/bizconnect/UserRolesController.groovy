package com.bizconnect

import org.springframework.dao.DataIntegrityViolationException

class UserRolesController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userRolesInstanceList: UserRoles.list(params), userRolesInstanceTotal: UserRoles.count()]
    }

    def create() {
        [userRolesInstance: new UserRoles(params)]
    }

    def save() {
        def userRolesInstance = new UserRoles(params)
        if (!userRolesInstance.save(flush: true)) {
            render(view: "create", model: [userRolesInstance: userRolesInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'userRoles.label', default: 'UserRoles'), userRolesInstance.id])
        redirect(action: "show", id: userRolesInstance.id)
    }

    def show(Long id) {
        def userRolesInstance = UserRoles.get(id)
        if (!userRolesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userRoles.label', default: 'UserRoles'), id])
            redirect(action: "list")
            return
        }

        [userRolesInstance: userRolesInstance]
    }

    def edit(Long id) {
        def userRolesInstance = UserRoles.get(id)
        if (!userRolesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userRoles.label', default: 'UserRoles'), id])
            redirect(action: "list")
            return
        }

        [userRolesInstance: userRolesInstance]
    }

    def update(Long id, Long version) {
        def userRolesInstance = UserRoles.get(id)
        if (!userRolesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userRoles.label', default: 'UserRoles'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userRolesInstance.version > version) {
                userRolesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'userRoles.label', default: 'UserRoles')] as Object[],
                          "Another user has updated this UserRoles while you were editing")
                render(view: "edit", model: [userRolesInstance: userRolesInstance])
                return
            }
        }

        userRolesInstance.properties = params

        if (!userRolesInstance.save(flush: true)) {
            render(view: "edit", model: [userRolesInstance: userRolesInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'userRoles.label', default: 'UserRoles'), userRolesInstance.id])
        redirect(action: "show", id: userRolesInstance.id)
    }

    def delete(Long id) {
        def userRolesInstance = UserRoles.get(id)
        if (!userRolesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userRoles.label', default: 'UserRoles'), id])
            redirect(action: "list")
            return
        }

        try {
            userRolesInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userRoles.label', default: 'UserRoles'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userRoles.label', default: 'UserRoles'), id])
            redirect(action: "show", id: id)
        }
    }
}
