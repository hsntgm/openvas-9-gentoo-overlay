# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{4,5,6,7} )
inherit distutils-r1

DESCRIPTION="Openvas OSP (Open Scanner Protocol)"
HOMEPAGE="http://www.openvas.org/"
SRC_URI="https://github.com/greenbone/ospd/archive/v1.3.2.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE="extras"

DEPEND="
	dev-python/paramiko[${PYTHON_USEDEP}]
	dev-python/defusedxml[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]"

RDEPEND="${DEPEND}"
PDEPEND=">=net-analyzer/openvas-9.0.0"

python_prepare_all() {
	distutils-r1_python_prepare_all
}

python_compile() {
	if use extras; then
		/bin/bash "${S}"/doc/generate
		HTML_DOCS=( "${S}"/doc/. )
	fi
	distutils-r1_python_compile
}

python_install_all() {
	distutils-r1_python_install_all
}
