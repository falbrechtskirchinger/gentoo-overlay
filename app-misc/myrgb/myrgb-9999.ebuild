EAPI=8

inherit cmake git-r3 systemd

DESCRIPTION="Control utility for RGB devices"
HOMEPAGE="https://github.com/falbrechtskirchinger/myrgb"
EGIT_REPO_URI="https://github.com/falbrechtskirchinger/myrgb.git"

LICENSE="all-rights-reserved"
SLOT="0"

DEPEND="
	dev-libs/hidapi
	dev-cpp/nlohmann_json
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
"

src_configure() {
	local mycmakeargs=(
		-DSYSTEMD_UNIT_INSTALL_DIR=$(systemd_get_systemunitdir)
	)
	cmake_src_configure
}
