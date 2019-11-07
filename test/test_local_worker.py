import syft as sy
import torch as th


def test_client_worker_does_not_register_object(hook):
    me = hook.local_worker
    me.is_client_worker = True
    x = th.tensor([1, 2, 3])
    assert x.id not in me._objects


def test_object_registration(hook):
    me = hook.local_worker
    me.is_client_worker = False
    x = th.tensor([1, 2, 3])
    assert x.id in me._objects

<<<<<<< HEAD
=======
    me.is_client_worker = True


def test_pointer_registration(workers, hook):
    alice = workers["alice"]
    me = hook.local_worker
    me.is_client_worker = False
    x_ptr = th.tensor([1, 2, 3]).send(alice)
    assert x_ptr.id in me._objects

    me.is_client_worker = True


def test_fix_prec_tensor_registration(hook):
    me = hook.local_worker
    me.is_client_worker = False
    x_sh = th.tensor([1.0, 2, 3]).fix_prec()
    assert x_sh.id in me._objects

    me.is_client_worker = True


def test_shared_tensor_registration(workers, hook):
    alice, bob, charlie = workers["alice"], workers["bob"], workers["charlie"]
    me = hook.local_worker
    me.is_client_worker = False
    x_sh = th.tensor([1.0, 2, 3]).fix_prec().share(alice, bob, crypto_provider=charlie)
    assert x_sh.id in me._objects

    me.is_client_worker = True


def test_shared_tensor_registration_pointer(workers, hook):
    alice, bob, charlie, james = (
        workers["alice"],
        workers["bob"],
        workers["charlie"],
        workers["james"],
    )
    me = hook.local_worker
    me.is_client_worker = False
    x_ptr = th.tensor([1, 2, 3]).send(alice)
    x_sh = x_ptr.fix_prec().share(bob, charlie, crypto_provider=james)
    assert x_sh.id in me._objects

    me.is_client_worker = True

>>>>>>> a8ab8d67ff49de7ebdbff318a08c08bdce9ba1fe

def test_in_known_workers(hook):
    # Get local worker
    local_worker = hook.local_worker
    id = local_worker.id

    # Get known workers dict
    known_workers = local_worker._known_workers

    assert id in known_workers and local_worker == known_workers[id]
