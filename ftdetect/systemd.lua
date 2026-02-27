vim.filetype.add({
    extension = {
        -- Systemd unit files
        service = "systemd",
        socket = "systemd",
        timer = "systemd",
        mount = "systemd",
        automount = "systemd",
        swap = "systemd",
        target = "systemd",
        path = "systemd",
        slice = "systemd",
        scope = "systemd",
        device = "systemd",
        -- Podman Quadlet files
        container = "systemd",
        volume = "systemd",
        network = "systemd",
        kube = "systemd",
        pod = "systemd",
        build = "systemd",
        image = "systemd",
    }
})
