# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit readme.gentoo-r1

DESCRIPTION="A remote security scanner"
HOMEPAGE="http://www.openvas.org/"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE="+extras +cli +gsa +ospd ldap radius"

DEPEND="
	radius? ( >=net-analyzer/openvas-libraries-9.0.3[radius] )
	ldap? ( >=net-analyzer/openvas-libraries-9.0.3[ldap] )
	>=net-analyzer/openvas-libraries-9.0.3
	>=net-analyzer/openvas-scanner-5.1.3
	>=net-analyzer/openvas-manager-7.0.3
	gsa? ( >=net-analyzer/greenbone-security-assistant-7.0.3 )
	cli? ( >=net-analyzer/gvm-tools-1.4.1 )
	ospd? ( >=net-analyzer/ospd-1.3.2 )
	extras? (
		>=net-analyzer/openvas-libraries-9.0.3[extras]
		>=net-analyzer/openvas-scanner-5.1.3[extras]
		>=net-analyzer/openvas-manager-7.0.3[extras]
		>=net-analyzer/greenbone-security-assistant-7.0.3[extras]
		>=net-analyzer/ospd-1.3.2[extras]
		app-doc/xmltoman
		app-text/htmldoc
		dev-texlive/texlive-latexextra
	)"

pkg_postinst() {
	FORCE_PRINT_ELOG=1
	"${FILESDIR}"/README.gentoo-"${SLOT}"
	readme.gentoo_create_doc
	readme.gentoo_print_elog
}
