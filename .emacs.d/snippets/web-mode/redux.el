# -*- mode: snippet -*-
# name: redux
# key: rdxcmp
# --
import React, { Component, PropTypes } from 'react';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

class $1 extends Component {
    render() {
        return $0
    }
}

$1.propTypes = {
    actions: PropTypes.shape({

    }).isRequired
};

const mapStateToProps = (state) =>  {
    return {};
};

const mapDispatchToProps = (dispatch) => {
    return {
        actions: bindActionCreators({

        }, dispatch)
    };
};

export default connect(mapStateToProps, mapDispatchToProps)($1);
