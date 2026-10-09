"""Intérprete de Python del proyecto.

Los paquetes se instalan dentro de .venv. Si manage.py se ejecuta con
el Python del sistema, use_project_python() relanza el mismo comando
con el intérprete del entorno virtual.
"""

import os
import sys
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent


def use_project_python():
    """Reejecuta el proceso con el Python de .venv si es necesario."""
    if os.name == "nt":
        raise RuntimeError(
            "Este proyecto utiliza un entorno virtual de Linux en WSL. "
            "Ejecuta los comandos de Django desde la terminal de WSL."
        )

    venv_root = PROJECT_ROOT / ".venv"
    venv_python = venv_root / "bin" / "python"

    if not venv_python.is_file():
        return

    try:
        if Path(sys.prefix).resolve() == venv_root.resolve():
            return
    except OSError:
        return

    os.execv(venv_python, [str(venv_python), *sys.argv])
