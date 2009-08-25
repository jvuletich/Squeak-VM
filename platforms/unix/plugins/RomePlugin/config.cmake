IF (PKG_CONFIG_FOUND)
    PKG_CHECK_MODULES (PANGOCAIRO pangocairo)
    PKG_CHECK_MODULES (FREETYPE freetype2)
    IF (PANGOCAIRO_FOUND AND FREETYPE_FOUND)
        SET (CMAKE_REQUIRED_INCLUDES ${PANGOCAIRO_INCLUDE_DIRS} ${FREETYPE_INCLUDE_DIRS})
        CHECK_INCLUDE_FILE (cairo-ft.h HAVE_CAIRO_FT_H)
    ENDIF ()
ENDIF ()

IF (HAVE_CAIRO_FT_H)
    PLUGIN_INCLUDE_DIRECTORIES (${PANGOCAIRO_INCLUDE_DIRS} ${FREETYPE_INCLUDE_DIRS} ${cross}/plugins/SurfacePlugin)
    PLUGIN_LINK_DIRECTORIES    (${PANGOCAIRO_LIBRARY_DIRS} ${FREETYPE_LIBRARY_DIRS})
    PLUGIN_LINK_LIBRARIES      (${PANGOCAIRO_LIBRARIES}    ${FREETYPE_LIBRARIES})
ELSE ()
    PLUGIN_DISABLE ()
ENDIF ()
