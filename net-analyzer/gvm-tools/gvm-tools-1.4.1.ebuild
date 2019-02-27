# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{5,6} )
inherit distutils-r1

DESCRIPTION="A remote security scanner for Linux (OpenVAS-cli)"
HOMEPAGE="http://www.openvas.org/"
SRC_URI="https://github.com/greenbone/gvm-tools/archive/v1.4.1.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/paramiko[${PYTHON_USEDEP}]
	dev-python/defusedxml[${PYTHON_USEDEP}]
	dev-python/pythondialog:0[${PYTHON_USEDEP}]"

RDEPEND="
	${DEPEND}
	dev-python/setuptools
	!net-analyzer/openvas-cli"

PDEPEND="
	>=net-analyzer/openvas-9.0.0"

src_prepare() {
	distutils-r1_python_prepare_all
	# Fix build issue
	sed -i "s/packages=find_packages(),.*/packages=find_packages(exclude=['tests*', 'docs']),/" "$S"/setup.py || die
}
